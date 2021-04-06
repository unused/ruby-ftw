
lines = File.readlines './slides.md'

insert_at = lines.find_index { |line| line.include? 'NOTE: build some code' }

def create_slide(img_file)
  <<~END_SLIDE

    # #{File.basename(img_file).gsub(/-_/, ' ')}

    ![](#{img_file})

  END_SLIDE
end

content = [
  lines[0..insert_at],
  Dir.glob('./coding-backup/*.png').sort.map { |img| create_slide img },
  lines[insert_at..-1]
].flatten.join

File.write 'slides-backup.md', content

