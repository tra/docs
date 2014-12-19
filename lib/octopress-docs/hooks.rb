module Octopress
  module Docs
    class DocsSiteHook < Octopress::Hooks::Site
      def post_read(site)
        if ENV['OCTOPRESS_DOCS']
          Octopress.site = site
          site.pages.concat Octopress::Docs.pages
        end
      end

      def merge_payload(payload, site)
        if ENV['OCTOPRESS_DOCS']
          Octopress::Docs.pages_info
        end
      end
    end
  end
end
