=begin
Example:
    require 'hyperlink_for_url'
    
    str = "必読！ http://gettingreal.37signals.com/GR_jpn.php ど う ぞ"
    converted =  HyperlinkForUrl::Conversion.conversion(str)

Note:
    It made it on November 28, 2007
    It made it with Ruby 1.8.6
    The character-code is utf8
    It corresponds to http: and https:
=end

module HyperlinkForUrl
  class Conversion
    def self.number_of_checks_of_http(str)
      str << "\n"
      i = count = 0
      check = ""
      @delimitation = []
      str.each_byte {|c|
        if check == "http:" || check == "https:"
          @delimitation[i] = count-5 if check == "http:"
          @delimitation[i] = count-6 if check == "https:"
          i = i + 1
          check = ""
        end
      
        if check == "http" || check == "https"
          check << ":" if c == 58   # 58=>:
          check << ":" if c == 115  # 115=>s
        end
       
        if check == "htt"
          check << "p" if c == 112  # 112=>p
        end

        if check == "ht"
          check << "t" if c == 116  # 116=>t
        end
        
        if check == "h"
          check = check + "t" if c == 116  # 116=>t
        end
        
        check = "h" if c == 104  # 104=>h
        
      count = count + 1
      }
      @delimitation
    end

    def self.hyperlink_for_url(str,url)
      # binding.pry
      cutting_url = []
      y = 0
      url.each do |val1|
      #(httpから数えて、最初の「半角空白」もしくは「改行」の場所を取得)
        i = count =0
        @delimitation = []
        str.each_byte {|c|
          if 32 == c  # 32=>SP
            @delimitation[i] = count
            i = i + 1
          end

          if 10 == c  # 10=>\n
            @delimitation[i] = count
            i = i + 1
          end

          if 13 == c  # 13=>\r
            @delimitation[i] = count
            i = i + 1
          end
        count = count + 1
        }

        #(配列のなかから、val1より数字が大きい中で、一番数が小さいものを探す。)
        @delimitation.delete_if {|x| x <= val1}
        
        #配列が空だったら count を代入
        if @delimitation == []
          @delimitation[0] = count
        end

        #(URL切り出し)
        cutting_url[y] = str[val1..@delimitation[0]-1]
        y = y + 1
      end

      n = 0
      record = []
      cutting_url.each do |u|
        #aタグを使ってハイパーリンクにする
        if record == []
            #str = str.gsub(/#{u}\s|#{u}\r|#{u}\r\n|#{u}\n/, "<a href='#{u}'>#{u}</a>")
            str = str.gsub("#{u}", "<a href='#{u}'>#{u}</a>")
            record[n] = u
            n = n + 1
        else
          record.each do |r|
            @check = false
            if r != u
              @check = true
            end
          end
          
          if @check
            #str = str.gsub(/#{u}\s|#{u}\r|#{u}\r\n|#{u}\n/, "<a href='#{u}'>#{u}</a>")
            str = str.gsub("#{u}", "<a href='#{u}'>#{u}</a>")
            record[n] = u
            n = n + 1
          end
        end
      end
      str
    end

    def self.conversion(str)
      address = self.number_of_checks_of_http(str)
      str = self.hyperlink_for_url(str,address)
      str = str.chomp
      str
    end
  end
end