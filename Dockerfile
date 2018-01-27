FROM debian

RUN apt-get update && apt-get install -y iceweasel && \
    apt-get autoremove && apt-get clean

# pref("media.webm.enabled", false); \n\
# pref("media.mediasource.webm.enabled", false); \n\
RUN echo $' \n\
pref("browser.rights.3.shown", true); \n\
pref("datareporting.healthreport.service.firstRun", false); \n\
pref("datareporting.healthreport.service.enabled", false); \n\
pref("datareporting.healthreport.uploadEnabled", false); \n\
pref("datareporting.policy.dataSubmissionEnabled", false); \n\
pref("browser.reader.detectedFirstArticle", true); \n\
pref("pdfjs.firstRun", false); \n\
pref("toolkit.telemetry.reportingpolicy.firstRun", false); \n\
pref("browser.startup.homepage_override.mstone", "ignore"); \n\
pref("browser.newtabpage.enabled", false); \n\
pref("browser.newtabpage.enhanced", false); \n\
pref("browser.newtabpage.introShown", false); \n\
pref("middlemouse.contentLoadURL", false); \n\
' >> /usr/share/firefox-esr/browser/defaults/preferences/firefox-branding.js

# Setting up user environment
RUN find / -type f -perm /6000 -exec chmod -s {} + 2>/dev/null || true && \
    groupadd -g 1000 user && useradd -g user -m -u 1000 user
USER user
ENV HOME /home/user

# It's go time
CMD /usr/bin/firefox -no-remote
