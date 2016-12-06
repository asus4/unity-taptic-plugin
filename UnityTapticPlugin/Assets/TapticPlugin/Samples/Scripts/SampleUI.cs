using UnityEngine;

namespace TapticPlugin
{
    public class SampleUI : MonoBehaviour
    {
        public void OnNotificationClick(int index)
        {
            TapticManager.Notification((NotificationFeedback)index);
            Debug.LogFormat("notification {0}", index);
        }

        public void OnImpactClick(int index)
        {
            TapticManager.Impact((ImpactFeedback)index);
            Debug.LogFormat("impact {0}", index);
        }

        public void OnSelectionUpdate()
        {
            TapticManager.Selection();
            Debug.Log("selection");
        }
    }

}


