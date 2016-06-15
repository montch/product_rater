module SourcesHelper
  def sources_for_select
    Source.all.collect { |m| [m.name, m.id] }
  end
end
