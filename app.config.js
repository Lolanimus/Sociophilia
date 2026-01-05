module.exports = {
  expo: {
    name: "Sociophilia",
    slug: "sociophilia",
    version: "1.0.0",
    orientation: "portrait",
    icon: "./assets/images/icon.png",
    scheme: "sociophilia",
    userInterfaceStyle: "automatic",
    newArchEnabled: true,
    updates: {
      url: "https://u.expo.dev/8be155cc-4318-4ab9-97f0-89e7f64b84ff",
    },
    runtimeVersion: {
      policy: "appVersion"
    },
    ios: {      
      UIDesignRequiresCompatibility: true,
      supportsTablet: true,
      bundleIdentifier: "com.lolanimus.sociophilia",
    },
    android: {
      adaptiveIcon: {
        foregroundImage: "./assets/images/adaptive-icon.png",
        backgroundColor: "#ffffff",
      },
      edgeToEdgeEnabled: true,
      package: "com.lolanimus.sociophilia",
    },
    web: {
      bundler: "metro",
      output: "static",
      favicon: "./assets/images/favicon.png",
    },
    plugins: [
      "expo-router",
      [
        "expo-splash-screen",
        {
          image: "./assets/images/splash-icon.png",
          imageWidth: 200,
          resizeMode: "contain",
          backgroundColor: "#ffffff",
        },
      ],
      "expo-secure-store",
      "expo-web-browser"
    ],
    experiments: {
      typedRoutes: true,
    },
    extra: {
      router: {},
      eas: {
        projectId: "8be155cc-4318-4ab9-97f0-89e7f64b84ff",
      },
    },
    owner: "lolanimus",
  },
};
