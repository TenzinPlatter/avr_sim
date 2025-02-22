pub struct Command16 {
    name: String,
    first_arg: Option<u8>,
    second_arg: Option<u8>,
    callback: FnMut,
}

pub struct Command32 {
    name: String,
    first_arg: Option<u16>,
    second_arg: Option<u16>,
    callback: dyn FnMut<>,
}
