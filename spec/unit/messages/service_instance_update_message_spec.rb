require 'spec_helper'
require 'messages/service_instance_update_message'

module VCAP::CloudController
  RSpec.describe ServiceInstanceUpdateMessage do
    let(:body) do
      {
        "metadata": {
          "labels": {
            "potato": 'mashed'
          },
          "annotations": {
            "cheese": 'bono'
          }
        }
      }
    end

    describe 'validations' do
      it 'validates that there are not excess fields' do
        body['bogus'] = 'field'
        message = ServiceInstanceUpdateMessage.new(body)

        expect(message).to_not be_valid
        expect(message.errors.full_messages).to include("Unknown field(s): 'bogus'")
      end

      it 'validates metadata' do
        message = ServiceInstanceUpdateMessage.new(body)

        expect(message).to be_valid
      end

      it 'complains about bogus metadata fields' do
        newbody = body.merge({ "metadata": { "choppers": 3 } })
        message = ServiceInstanceUpdateMessage.new(newbody)

        expect(message).not_to be_valid
      end
    end
  end
end
