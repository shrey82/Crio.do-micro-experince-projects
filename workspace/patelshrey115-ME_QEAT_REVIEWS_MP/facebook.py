# CRIO_SOLUTION_START_MODULE_FACEBOOK_SHARE_FROM_CLI
import json
import facebook
def get_facebook_tokens():
    f = open('facebook_tokens.json', 'r')
    content = f.read()
    f.close()
    data = json.loads(content)

    return data['facebook_tokens']

def extract_tokens(input_file, output_file):
    f = open(input_file, 'r')
    content = f.readlines()
    f.close()
    lst = []
    for c in content[1:]:
        entries = c.split(',')
        e = {'app_id' : entries[0], 'access_token' : entries[1], 'page_id' : entries[2]}
        lst.append(e)

    d = {'facebook_tokens' : lst}
    with open(output_file, 'w+') as fp:
        json.dump(d, fp, indent=4)

if __name__ == '__main__':
    token_output_filename = 'facebook_tokens.json'
    token_csv_file = '/home/arun/Downloads/facebook.csv'
    extract_tokens(token_csv_file, token_output_filename)
    all_tokens = get_facebook_tokens()
    print(all_tokens, len(all_tokens))
# CRIO_SOLUTION_START_MODULE_FACEBOOK_SHARE_FROM_CLI
