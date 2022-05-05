function replace_placeholders() {
    console.log(window.location.href);
    const urlParams = new URLSearchParams(window.location.search);
    replace_field("username", urlParams.get('username').replace(/[^a-z0-9]/g, ""));
}

function replace_field(field_name, field_value) {
    if (!field_value) {
        return;
    }
    const collection = document.getElementsByClassName("placeholder-" + field_name);
    for (let i = 0; i < collection.length; i++) {
        collection[i].innerHTML = field_value;
    }
}

window.onload = replace_placeholders;