class SchemaBrowserController < ApplicationController
  layout "schema_browser", :except => :schema

  def schema
    respond_to do |format|
      format.xml {
        render :xml => SchemaBrowser.schema_to_xml
      }
    end
  end
end
