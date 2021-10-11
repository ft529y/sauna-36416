require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    user = FactoryBot.create(:user)
    @event = FactoryBot.build(:event, user_id: user.id)
  end

  describe '予定登録機能（カレンダー）'
  context '登録できる時' do
    it 'execution_id,place,fee,start_timeが存在すれば登録できること' do
      expect(@event).to be_valid
    end

    it 'execution_idだけ存在すれば登録できること' do
      @event.place = ''
      @event.fee = ''
      @event.start_time = nil
      expect(@event).to be_valid
    end
  end

  context '登録できない時' do
    it 'execution_idが1だと登録できないこと' do
      @event.execution_id = 1
      @event.valid?
      expect(@event.errors.full_messages).to include '実施予定の項目は---以外を入力して下さい'
    end
  end
end
