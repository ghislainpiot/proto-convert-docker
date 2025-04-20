# proto-convert-docker

This repository contains a Docker build of the `proto-convert` tool.

**Please note:** This is not the original `proto-convert` project. It is a Docker image designed to provide a convenient way to run the existing `proto-convert` command-line tool within a containerized environment.

For information about the `proto-convert` tool itself, its features, and documentation, please refer to  the GitHub repository [here](https://github.com/iamazeem/proto-convert).

## How to Use

The Docker image bundles the `proto-convert` command. You can use it to run `proto-convert` commands against files in your current working directory by mounting it into the container.

1.  **Ensure you have Docker installed.**
2.  **Run the command:**
    Use the following command structure from your terminal in the directory containing the files you want `proto-convert` to process:

    ```bash
    docker run -it --rm \
        -v "$(pwd):/app" \
        -w /app \
        djipy/proto-convert:latest \
        [proto-convert options and arguments]
    ```
    *   `djipy/proto-convert:latest`: Specifies the Docker image to use. The `latest` tag points to the most recent version built.
    *   `[proto-convert options and arguments]`: This is where you pass any arguments or options you would normally pass to the `proto-convert` command itself.

**Example:**

To convert a protobuf file named `my_data.pb` in your current directory to JSON, you would run:

```bash
docker run -it --rm -v "$(pwd):/app" -w /app djipy/proto-convert:latest --mode b2j --proto your_file.proto --output my_data.json --msgtype your_message_type --input your_message.pb
```