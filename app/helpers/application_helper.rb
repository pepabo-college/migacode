module ApplicationHelper
  require "redcarpet"

  @@markdown = Redcarpet::Markdown.new Redcarpet::Render::HTML,
    # <> 文字で囲まれていない場合でもリンクを解析
    autolink: true,
    # 単語の中で強調を解析しないようにする
    no_intra_emphasis: true,
    # codeをクォートでブロックとして認識する ```ruby put ARGV[0] ```
    fenced_code_blocks: true,
    # HTMLを出力に許可しない。
    filter_html: true,
    # テーブルを使用可能にする
    tables: true,
    # 取り消し線の解析
    strikethrough: true

  def html(markdown)
    @@markdown.render(markdown).html_safe
  end
end
