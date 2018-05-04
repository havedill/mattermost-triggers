INSERT INTO Preferences (`UserId`, `Category`, `Name`, `Value`)
SELECT Id, 'theme', '', '{"awayIndicator":"#E0B333","buttonBg":"#26a970","buttonColor":"#ffffff","centerChannelBg":"#ffffff","centerChannelColor":"#333333","codeTheme":"github","linkColor":"#2389d7","mentionBg":"#F15340","mentionColor":"#ffffff","mentionHighlightBg":"#fff2bb","mentionHighlightLink":"#2f81b7","newMessageSeparator":"#F80","onlineIndicator":"#F79F66","sidebarBg":"#003E6B","sidebarHeaderBg":"#000a52","sidebarHeaderTextColor":"#FFFFFF","sidebarText":"#FFFFFF","sidebarTextActiveBorder":"#73AD0D","sidebarTextActiveColor":"#FFFFFF","sidebarTextHoverBg":"#D37C71","sidebarUnreadText":"#FFFFFF","type":"custom"}'
FROM Users WHERE Id NOT IN (
  SELECT userId FROM Preferences WHERE Category='theme'
);
