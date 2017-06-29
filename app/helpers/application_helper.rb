module ApplicationHelper
  require "redcarpet"
  require "coderay"

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      case language.to_s
        when 'rb'
          lang = 'ruby'
        when 'yml'
          lang = 'yaml'
        when 'css'
          lang = 'css'
        when 'html'
          lang = 'html'
        when ''
          lang = 'md'
        else
        lang = language
      end
      CodeRay.scan(code, lang).div
    end
  end

  def html(markdown)
    html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
    options = {
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
    }
    text = Redcarpet::Markdown.new(html_render, options)
    text.render(markdown).html_safe
  end
end


