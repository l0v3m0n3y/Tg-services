api="https://tg.services"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"
function register() {
		curl --request POST \
		--url "$api/register/" \
		--user-agent "$user_agent" \
		--header "x-requested-with: XMLHttpRequest" \
		--data "username=$1&email=$2&password=$3"
}
function login() {
		response=$(curl --request POST \
		--url "$api/login/" \
		--user-agent "$user_agent" \
		--header "x-requested-with: XMLHttpRequest" \
		--data "login=$1&password=$2" \
		-i -s)
		cookie=$(echo "$response" | grep -iE '^set-cookie:' | awk '{print $2}')
		echo $cookie
}