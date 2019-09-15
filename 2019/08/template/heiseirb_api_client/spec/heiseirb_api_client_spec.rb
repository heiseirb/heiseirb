require 'byebug'
RSpec.describe HeiseirbApiClient do
  it "has a version number" do
    expect(HeiseirbApiClient::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end

  context '#similar_users' do
    let(:user_id) { User.first.id }
    # 1. 該当ユーザのイベントスケジュールを全部取ってくる
    # 2. 1件目のイベントに登録しているユーザ全部引く(自身は除く)
    # 3. 2件目のイベントに登録しているユーザを取ってきて
    #
    subject do
      client = HeiseirbApiClient::SimilarUser.new
      client.similar_users(user_id)
    end
    it do
      subject
    end
  end






end
