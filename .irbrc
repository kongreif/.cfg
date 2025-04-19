# frozen_string_literal: true

if defined?(Reline::Face)
  Reline::Face.config(:completion_dialog) do |conf|
    conf.define :default, foreground: :white, background: :black
    conf.define :enhanced, foreground: :black, background: :white
    conf.define :scrollbar, foreground: :white, background: :black
  end
end
