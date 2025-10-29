// clerk-init.js
const script = document.createElement("script");
script.src = "https://cdn.jsdelivr.net/npm/@clerk/clerk-js@latest/dist/clerk.browser.js";
script.async = true;
script.crossOrigin = "anonymous";
script.dataset.clerkPublishableKey = "pk_test_cHJlbWl1bS1nb2JsaW4tMjIuY2xlcmsuYWNjb3VudHMuZGV2JA";

document.head.appendChild(script);

script.onload = async () => {
    await Clerk.load();
    Clerk.mountSignIn({
        element: document.getElementById("sign-in"),
        afterSignInUrl: "/Home/Secure"
    });
};
