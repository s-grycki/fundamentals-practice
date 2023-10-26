=begin
Write a function that when given a URL as a string, parses out just the domain 
name and returns it as a string. For example:
domain_name("http://github.com/carbonfive/raygun") == "github"
domain_name("http://www.zombie-bites.com") == "zombie-bites"
domain_name("https://www.cnet.com") == "cnet"

PROBLEM:
Take URL as string(input)
Return only domain name as string(output)
Domain name could start after a /, ., or start as itself(Implicit Rule)
Domain name will always end with a period(Implicit Rule)

EXAMPLES:
http://, https://, www., (could start with domain)
.(something)
"http://google.com" => [http:, "", google, com]

DATA STRUCTURES:
Input: String(as full URL)
Intermediate: Array(using regex character deliminators)
Output: String(only domain name from URL)

THOUGHTS:
Aside from domain name, what are possible elements?


ALGORITHM:
Split string into array of elements using forward slash or period [http:, "", google, com]
Delete empty elements from array [http:, google, com], [google, com]
If first element equals http://, https://, or www.
  Return array element at index 1
Else
  Return array element at index 0

=end

def domain_name(string)
  arr = string.split(/[\/.]/).reject(&:empty?)
  if %w(http: https: www).any? { |subdom| subdom == arr.first }
    return arr[1]
  else
    return arr.first
  end
end

p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"
p domain_name("youtube.com") == "youtube"
