require 'nokogiri'

# xmlの入力
xml = File.read("./sample1.xml")
doc = Nokogiri::XML(xml, nil, "UTF-8")
cnt = 0

doc.xpath('//company').each do |company|
	# <campany></campany>の要素に代入
	# 参考: http://forrst.com/posts/Setting_the_value_of_a_Nokogiri_element-7vz
	company.xpath('name')[0].content = cnt
	cnt += 1;
end

p doc.to_xml

# xmlの出力
# f = open('./sample_out.xml', 'w')
# f.puts doc.to_xml
