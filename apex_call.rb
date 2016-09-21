require 'restforce'

connection = {username: 'your_username',
              password: 'your_password',
              #security_token: '-',
              client_id: 'client_id',
              client_secret: '-',
              host: 'test.salesforce.com',
              instance_url: '-',
              api_version: '37.0'}


client = Restforce.tooling(connection) do |c|
  c.use Faraday::Response::Logger
end

tests = [{classId: '01p3C000000Cd6l',
          testMethods: ['modifyAgreementWithoutPrimaryContact']}
#         {maxFailedTests: '0'}
#        {testLevel: 'RunSpecifiedTests'}
]

response = client.api_post('runTestsAsynchronous', {tests: tests}.to_json)