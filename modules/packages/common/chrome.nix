{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    google-chrome
  ];
  nixpkgs.config.google-chrome.commandLineArgs = [
    "--enable-features=CapReferrerToOriginOnCrossOrigin,ContentSettingsPartitioning,EnableCsrssLockdown,HstsTopLevelNavigationsOnly,LocalNetworkAccessChecks:LocalNetworkAccessChecksWarn/false,LocalNetworkAccessChecksWebRTC,PartitionConnectionsByNetworkIsolationKey,ReduceAcceptLanguage,SplitCodeCacheByNetworkIsolationKey,SplitCacheByNetworkIsolationKey,SplitCacheByIncludeCredentials,SplitCacheByNavigationInitiator,StrictOriginIsolation"
    "--disable-features=AllowSwiftShaderFallback,AllowSoftwareGLFallbackDueToCrash,AutofillServerCommunication,BrowsingTopics,BrowsingTopicsDocumentAPI,BrowsingTopicsParameters,InterestFeedV2,NTPPopularSitesBakedInContent,UsePopularSitesSuggestions,LensStandalone,MediaDrmPreprovisioning,OptimizationHints,OptimizationHintsFetching,OptimizationHintsFetchingAnonymousDataConsent,OptimizationPersonalizedHintsFetching,OptimizationGuideModelDownloading,TextSafetyClassifier,PrivacySandboxSettings4,Reporting,CrashReporting,DocumentReporting,TabHoverCardImages,WebGPUBlobCache,WebGPUService"
    "--component-updater=--disable-pings"
    "--disable-breakpad"
    "--disable-crash-reporter"
    "--extension-content-verification=enforce_strict"
    "--extensions-install-verification=enforce_strict"
    "--js-flags=--jitless"
    "--js-flags=--disable-optimizing-compilers"
    "--no-pings"
    "--ozone-platform=$XDG_SESSION_TYPE"
  ];
  environment.etc."opt/chrome/policies/managed/default.json".text =
    builtins.toJSON {
      "AIModeSettings" = 1;
      "AlternateErrorPagesEnabled" = false;
      "AudioSandboxEnabled" = true;
      "AutofillAddressEnabled" = false;
      "AutofillCreditCardEnabled" = false;
      "AutofillPredictionSettings" = 2;
      "AutomatedPasswordChangeSettings" = 2;
      "BackgroundModeEnabled" = false;
      "BlockExternalExtensions" = true;
      "BlockThirdPartyCookies" = true;
      "BrowserLabsEnabled" = false;
      "BrowserSignin" = 0;
      "BuiltInAIAPIsEnabled" = false;
      "ChromeVariations" = 2;
      "ClearBrowsingDataOnExitList" = [
        "download_history"
        "cached_images_and_files"
        "autofill"
        "hosted_app_data"
      ];
      "ClickToCallEnabled" = false;
      "CloudPrintProxyEnabled" = false;
      "CreateThemesSettings" = 2;
      "DefaultBrowserSettingEnabled" = false;
      "DefaultJavaScriptJitSetting" = 2;
      "DefaultSensorsSetting" = 2;
      "DesktopSharingHubEnabled" = false;
      "DevToolsGenAiSettings" = 2;
      "Disable3DAPIs" = true;
      "DnsOverHttpsMode" = "secure";
      "DnsOverHttpsTemplates" = "https://freedns.controld.com/p2";
      "EnableMediaRouter" = false;
      "GeminiSettings" = 1;
      "GenAILocalFoundationalModelSettings" = 1;
      "GoogleSearchSidePanelEnabled" = false;
      "HardwareAccelerationModeEnabled" = false;
      "HelpMeWriteSettings" = 2;
      "HistoryClustersVisible" = false;
      "HistorySearchSettings" = 2;
      "HttpsOnlyMode" = "force_enabled";
      "LensOverlaySettings" = 1;
      "LensRegionSearchEnabled" = false;
      "LiveTranslateEnabled" = false;
      "MediaRecommendationsEnabled" = false;
      "MetricsReportingEnabled" = false;
      "NativeMessagingBlocklist" = ["*"];
      "NetworkPredictionOptions" = 2;
      "NTPCardsVisible" = false;
      "PasswordLeakDetectionEnabled" = false;
      "PasswordManagerEnabled" = false;
      "PaymentMethodQueryEnabled" = false;
      "PrivacySandboxAdMeasurementEnabled" = false;
      "PrivacySandboxAdTopicsEnabled" = false;
      "PrivacySandboxPromptEnabled" = false;
      "PrivacySandboxSiteEnabledAdsEnabled" = false;
      "PromotionsEnabled" = false;
      "PromptForDownloadLocation" = true;
      "ProtectedContentIdentifiersAllowed" = false;
      "RelatedWebsiteSetsEnabled" = false;
      "RemoteAccessHostAllowRemoteAccessConnections" = false;
      "RemoteAccessHostAllowRemoteSupportConnections" = false;
      "RemoteAccessHostFirewallTraversal" = false;
      "RemoteDebuggingAllowed" = false;
      "SafeBrowsingDeepScanningEnabled" = false;
      "SafeBrowsingExtendedReportingEnabled" = false;
      "SafeBrowsingProtectionLevel" = 1;
      "SafeBrowsingSurveysEnabled" = false;
      "SearchSuggestEnabled" = false;
      "SharedClipboardEnabled" = false;
      "ShoppingListEnabled" = false;
      "ShowFullUrlsInAddressBar" = true;
      "SitePerProcess" = true;
      "SpellCheckServiceEnabled" = false;
      "SyncDisabled" = true;
      "TabCompareSettings" = 2;
      "TLS13EarlyDataEnabled" = false;
      "TranslateEnabled" = false;
      "TranslatorAPIAllowed" = false;
      "UrlKeyedAnonymizedDataCollectionEnabled" = false;
      "UrlKeyedMetricsAllowed" = false;
      "UserAgentReduction" = 2;
      "UserFeedbackAllowed" = false;
      "WebRtcIPHandling" = "disable_non_proxied_udp";
      "WebRtcTextLogCollectionAllowed" = false;
      "WebUsbAskForUrls" = ["https://grapheneos.org"];
    };
  
  environment.etc."opt/chrome/policies/managed/extensions.json".text =
    builtins.toJSON {
      ExtensionInstallForcelist = [
        "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      ];
    };
}
