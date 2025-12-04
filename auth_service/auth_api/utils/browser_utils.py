def get_browser_info(request):
    user_agent = request.META.get('HTTP_USER_AGENT', '')

    browser = "Unknown Browser"
    os = "Unknown OS"

    # Browser detection
    if "Chrome" in user_agent and "Edg" not in user_agent:
        browser = "Google Chrome"
    elif "Firefox" in user_agent:
        browser = "Mozilla Firefox"
    elif "Safari" in user_agent and "Chrome" not in user_agent:
        browser = "Safari"
    elif "Edg" in user_agent:
        browser = "Microsoft Edge"
    elif "OPR" in user_agent or "Opera" in user_agent:
        browser = "Opera"

    # OS detection
    if "Windows" in user_agent:
        os = "Windows"
    elif "Mac OS X" in user_agent:
        os = "macOS"
    elif "Linux" in user_agent:
        os = "Linux"
    elif "Android" in user_agent:
        os = "Android"
    elif "iPhone" in user_agent or "iPad" in user_agent:
        os = "iOS"

    return browser, os
