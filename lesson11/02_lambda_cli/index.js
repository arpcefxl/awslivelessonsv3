exports.handler = async (event) => {
    // TODO implement
    const response = {
        statusCode: 200,
        body: JSON.stringify('Hello world, this is a test Lambda function!'),
    };
    return response;
};
