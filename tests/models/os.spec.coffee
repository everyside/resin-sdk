m = require('mochainon')
nock = require('nock')
Promise = require('bluebird')
settings = require('../../lib/settings')
os = require('../../lib/models/os')
johnDoeFixture = require('../tokens.json').johndoe

describe 'OS Model:', ->

	describe 'given a /whoami endpoint', ->

		beforeEach (done) ->
			settings.get('apiUrl').then (apiUrl) ->
				nock(apiUrl).get('/whoami').reply(200, johnDoeFixture.token)
				done()

		afterEach ->
			nock.cleanAll()

		describe '.download()', ->

			describe 'given valid parameters', ->

				beforeEach (done) ->
					settings.get('imageMakerUrl').then (imageMakerUrl) ->
						nock(imageMakerUrl).get('/api/v1/image/raspberry-pi/')
							.reply(200, 'Lorem ipsum dolor sit amet')
						done()

				afterEach ->
					nock.cleanAll()

				it 'should stream the download', (done) ->
					os.download('raspberry-pi').then (stream) ->
						result = ''
						stream.on 'data', (chunk) -> result += chunk
						stream.on 'end', ->
							m.chai.expect(result).to.equal('Lorem ipsum dolor sit amet')
							done()

				it 'should stream the download after a slight delay', (done) ->
					os.download('raspberry-pi').then (stream) ->
						return Promise.delay(200).return(stream)
					.then (stream) ->
						result = ''
						stream.on 'data', (chunk) -> result += chunk
						stream.on 'end', ->
							m.chai.expect(result).to.equal('Lorem ipsum dolor sit amet')
							done()

			describe 'given invalid parameters', ->

				beforeEach (done) ->
					settings.get('imageMakerUrl').then (imageMakerUrl) ->
						nock(imageMakerUrl).get('/api/v1/image/raspberry-pi/')
							.reply(404, 'No such device type')
						done()

				afterEach ->
					nock.cleanAll()

				it 'should be rejected with an error message', ->
					promise = os.download('raspberry-pi')
					m.chai.expect(promise).to.be.rejectedWith('No such device type')
