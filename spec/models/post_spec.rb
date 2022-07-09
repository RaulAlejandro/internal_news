require 'rails_helper'

RSpec.describe Post, type: :model do

  before(:all) do
    @post = create( :post )
    #post.save
  end

  context 'Association' do
    it { is_expected.to belong_to(:user) }
  end
  
  context 'Validations' do
    it { expect(subject).to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:user) }
  end

  describe "#Search by Autor & date range" do
    before(:each) do
      # Base data
        @start_date = Date.today
        @end_date   = Date.today + 1.week
        @autor      = @post.user.name
    end
    context 'When autor value is present' do    
      it "Should return >= 1" do          
        result = Post.search(@autor, @start_date, @end_date, nil)
        expect(result.count).to  be >= 1
      end

      it "Should return 0" do 
        random = (0...50).map { ('a'..'z').to_a[rand(26)] }.join        
        result = Post.search(random, @start_date, @end_date, nil)
        expect(result.count).to  eq(0)
      end
    end
  end

end