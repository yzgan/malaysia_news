class FormatTooltip < ActiveInteraction::Base
  string :tooltip
  boolean :html, default: false
  integer :length, default: 5

  def execute
    injecting_newline_to(partitioning_tooltips).join(' ')
  end

  private

    def partitioning_tooltips
      words = tooltip.split(' ')
      [].tap do |partition_words|
        (words.size / length).times do
          partition_words << words.slice!(0..length)
        end
      end
    end

    def injecting_newline_to(partition)
      partition.map { |element| element.push(newline) }
    end

    def newline
      html ? '<br/>' : "\n"
    end
end
