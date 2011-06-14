# Copywriting engine for Refinery CMS

You want to move your website to Refinery CMS, but the SEO guy don't like the idea of loosing control of URLs?

Create your own custom routes for fine grained rules! Take the control of URLs and redirect legacy URLs.

## Install

    # Gemfile
    gem 'refinerycms-routes'

    bundle
    rails generate refinerycms_routes
    rake db:migrate

This is going to create routes for the current locale and create a default page controller that use custom routes.

## Pull request?

Yes.

## Helper method

    custom_url_for(@page)

or pass locale instead of using current globalize locale

    custom_url_for(@page, :en)


Return first matching Route or fallback to default @page.url method