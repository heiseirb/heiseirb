require 'byebug'
RSpec.describe HeiseirbApiClient do
  it "has a version number" do
    expect(HeiseirbApiClient::VERSION).not_to be nil
  end

  context '#similar_users' do
    let(:user_id) { 1 }

    subject do
      client = HeiseirbApiClient::CRUD::User.new
      client.similar_users(user_id)
    end
    it do
      subject
      expect(subject).to eq([95, 38, 77])
    end
  end
end
