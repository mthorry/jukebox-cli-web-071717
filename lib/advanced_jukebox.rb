#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer
# require 'pry'

# my_songs = {
# "Go Go GO" => '/Users/matt/Development/code/jukebox-cli-web-071717/audio/Emerald-Park/01.mp3',
# "LiberTeens" => '/Users/matt/Development/code/jukebox-cli-web-071717/audio/Emerald-Park/02.mp3',
# "Hamburg" =>  '/Users/matt/Development/code/jukebox-cli-web-071717/audio/Emerald-Park/03.mp3',
# "Guiding Light" => '/Users/matt/Development/code/jukebox-cli-web-071717/audio/Emerald-Park/04.mp3',
# "Wolf" => '/Users/matt/Development/code/jukebox-cli-web-071717/audio/Emerald-Park/05.mp3',
# "Blue" => '/Users/matt/Development/code/jukebox-cli-web-071717/audio/Emerald-Park/06.mp3',
# "Graduation Failed" => '/Users/matt/Development/code/jukebox-cli-web-071717/audio/Emerald-Park/07.mp3'
# }

def helper
  puts "
I accept the following commands:
  - help : displays this help message
  - list : displays a list of songs you can play
  - play : lets you choose a song to play
  - exit : exits this program
  "
end



def list(my_songs)
  puts "
Song Titles:"
  song_titles = my_songs.keys
  song_titles.map.with_index(1) do |song, index|
    puts "#{index}. #{song}"
  end
end



  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
def play(my_songs)
  puts "Please enter a song name:"
  input = gets.chomp
    if my_songs.keys.include?(input)
      puts "Now playing #{input}"
      system "open #{my_songs[input]}"
    else
      puts "Invalid input, please try again
      "
      play(my_songs)
    end
end

def exit_jukebox
  puts "Goodbye"
end

def run(my_songs)
  helper
  puts "Please enter a command:"
  input = gets.downcase.chomp
  if input == "help"
    run(my_songs)
  elsif input == "list"
    list(my_songs)
    puts " "
    play(my_songs)
  elsif input == "play"
    play(my_songs)
  elsif input == "exit"
    exit_jukebox
  else
    puts "
  Invalid input, please try again"
    run(my_songs)
  end
end
