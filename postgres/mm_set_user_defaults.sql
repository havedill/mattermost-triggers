CREATE OR REPLACE FUNCTION mm_set_newuser_defaults() RETURNS TRIGGER AS
$BODY$
BEGIN

  IF (SELECT COUNT(*) FROM Preferences
  WHERE UserId=NEW.Id AND 'Category'='theme') = 0 THEN
  INSERT INTO Preferences (UserId, Category, Name, Value)
  VALUES (NEW.Id, 'theme', '', '{"awayIndicator":"#23b6c9","buttonBg":"#77c373","buttonColor":"#ffffff","centerChannelBg":"#fdfdfd","centerChannelColor":"#4b4b4b","codeTheme":"solarized-dark","errorTextColor":"#ff6461","linkColor":"#77c373","mentionBj":"#b74a4a","mentionColor":"#ffffff","mentionHighlightBg":"#e8ffe7","mentionHighlightLink":"#77c373","newMessageSeparator":"#77c373","onlineIndicator":"#77c373","sidebarBg":"#093f4b","sidebarHeaderBg":"#08353f","sidebarHeaderTextColor":"#ffffff","sidebarText":"#ffffff","sidebarTextActiveBorder":"#77c373","sidebarTextActiveColor":"#ffffff","sidebarTextHoverBg":"#156573","sidebarUnreadText":"#ffffff"}');
  END IF;

  IF (SELECT COUNT(*) FROM Preferences
  WHERE UserId=NEW.Id AND 'Category'='advanced_settings' AND 'Name'='join_leave') = 0 THEN
  INSERT INTO Preferences (UserId, Category, Name, Value)
  VALUES (NEW.Id, 'advanced_settings', 'join_leave', 'false');
  END IF;

  RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS mm_on_newuser ON Users;
CREATE TRIGGER mm_on_newuser
AFTER INSERT ON Users
FOR EACH ROW
EXECUTE PROCEDURE mm_set_newuser_defaults();
