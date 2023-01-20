require 'spec_helper'

describe Genre do
  context 'class after recieving arguments' do
    before :each do
      @label = 'Rap'
      @genre = Genre.new(@label)
    end

    it 'should be an instance of Genre class' do
      expect(@genre).to be_instance_of Genre
    end

    it 'should have an instance variable items which is an array' do
      expect(@genre.items).to be_instance_of Array
    end

    it 'should correctly return the name of the genre' do
      expect(@genre.name).to eq @label
    end

    describe '#add_item' do
      it 'should correctly add an item' do
        album = MusicAlbum.new('2023/12/25', on_spotify: true)
        @genre.add_item(album)
        expect(@genre.items).to eq([album])
      end
    end
  end
end
