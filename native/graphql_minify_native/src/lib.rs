use graphql_minify::LexingError;
use rustler::NifException;

#[derive(Debug, NifException)]
#[module = "GraphQLMinify.Exception"]
pub struct Exception {
    message: String,
}

impl From<LexingError> for Exception {
    fn from(err: LexingError) -> Exception {
        let message = match err {
            LexingError::UnknownToken => "unknown token".to_string(),
            LexingError::UnterminatedString(position) => {
                format!("unterminated string started at position: {}", position)
            }
        };
        Exception { message }
    }
}

#[rustler::nif]
fn minify(gql: &str) -> Result<String, Exception> {
    Ok(graphql_minify::minify(gql)?)
}

rustler::init!("Elixir.GraphQLMinify.Native");
