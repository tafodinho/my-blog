require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "isDraf? returns true for draft post" do
    assert blog_posts(:draft).isDraft?
  end

  test "isDraf? returns false for published post" do
    refute blog_posts(:published).isDraft?
  end

  test "isDraf? returns false for scheduled post" do
    refute blog_posts(:scheduled).isDraft?
  end

  test "isPublised? returns true for published post" do
    assert blog_posts(:published).isPublished?
  end

  test "isPublished? returns false for shcheduled post" do
    refute blog_posts(:scheduled).isPublished?
  end

  test "isPublished? returns false for draft post" do
    refute blog_posts(:draft).isPublished?
  end

  test "isScheduled? returns true for draft post" do
    assert blog_posts(:scheduled).isScheduled?
  end

  test "isScheduled? returns false for published post" do
    refute blog_posts(:published).isScheduled?
  end

  test "isScheduled? returns false for draft post" do
    refute blog_posts(:draft).isScheduled?
  end

end
