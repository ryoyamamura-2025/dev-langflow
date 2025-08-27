import requests
import os

# API Configuration
try:
    api_key = os.environ["LANGFLOW_API_KEY"]
except KeyError:
    raise ValueError("LANGFLOW_API_KEY environment variable not found. Please set your API key in the environment variables.")

url = "http://127.0.0.1:7860/api/v1/run/b3cc6048-37df-4176-b19d-12b9fbc05d99"  # The complete API endpoint URL for this flow

# Request payload configuration
payload = {
    "output_type": "chat",
    "input_type": "chat",
    "input_value": "Research the effectiveness of different prompt engineering techniques in controlling AI hallucinations, with focus on real-world applications and empirical studies."
}

# Request headers
headers = {
    "Content-Type": "application/json",
    "x-api-key": api_key  # Authentication key from environment variable
}

try:
    # Send API request
    response = requests.request("POST", url, json=payload, headers=headers)
    response.raise_for_status()  # Raise exception for bad status codes

    # Print response
    print(response.text)

except requests.exceptions.RequestException as e:
    print(f"Error making API request: {e}")
except ValueError as e:
    print(f"Error parsing response: {e}")