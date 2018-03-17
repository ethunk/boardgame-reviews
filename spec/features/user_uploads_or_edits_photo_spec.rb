require 'rails_helper'
require 'carrierwave/test/matchers'
# Acceptance Criteria
# [x] There is an upload photo button
# [x] CarrierWave scales photo
# [x] CarrierWave saves a thumbnail version

feature "CarrierWave uploader stores associated photos with model" do

  boardgame = FactoryBot.create(:boardgame)
  let(:uploader) { BoardgamePhotoUploader.new(boardgame) }

  before do
    BoardgamePhotoUploader.enable_processing = true
    File.open('public/uploads/boardgame/boardgame_photo/32/thumb_monopoly_board_2013_by_jdwinkerman-d7itj2q.jpg') { |f| uploader.store!(f) }
  end

  after do
    BoardgamePhotoUploader.enable_processing = false
    uploader.remove!
  end


  it "scales down a landscape image to be exactly 64 by 64 pixels" do
    expect(uploader.thumb).to have_dimensions(150, 150)
  end


  it "has the correct format" do
    expect(uploader).to be_format('jpeg')
  end

end
