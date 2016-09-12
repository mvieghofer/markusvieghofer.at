require "set"
module Jekyll

    class TagPage < Page
        def initialize(site, base, dir, tag)
            @site = site
            @base = base
            @dir = dir
            @name = 'index.html'

            self.process(@name)
            self.read_yaml(File.join(base, '_layouts'), 'tag.html')
            self.data['tag'] = tag
            self.data['title'] = "Posts Tagged &ldquo;"+tag+"&rdquo;"
        end
    end

    class TagIndex < Page
        def initialize(site, base, dir, tags)
            @site = site
            @base = base
            @dir = dir
            @name = 'index.html'

            self.process(@name)
            self.read_yaml(File.join(base, '_layouts'), 'tag_index.html')
            self.data['tags'] = tags
        end
    end

    class TagGenerator < Generator
        safe true

        def generate(site)
            if site.layouts.key? 'tag_index'
                dir = 'tag'
                allTags = Set.new
                site.tags.keys.each do |tag|
                    write_tag_page(site, File.join(dir, tag), tag)
                    allTags.add(tag)
                end
                write_tag_index(site, dir, allTags)
            end
        end

        def write_tag_page(site, dir, tag)
            tagPage = TagPage.new(site, site.source, dir, tag)
            tagPage.render(site.layouts, site.site_payload)
            tagPage.write(site.dest)
            site.pages << tagPage
        end

        def write_tag_index(site, dir, allTags)
            tagIndex = TagIndex.new(site, site.source, dir, allTags)
            tagIndex.render(site.layouts, site.site_payload)
            tagIndex.write(site.dest)
            site.pages << tagIndex
        end
    end

end
