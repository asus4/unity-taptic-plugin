using UnityEngine;
using UnityEngine.UI;

namespace TapticPlugin
{
    [RequireComponent(typeof(Button))]
    public class TapticButton : MonoBehaviour
    {
        public enum Feedback
        {
            NotificationSuccess,
            NotificationWarning,
            NorificationError,
            ImpactLight,
            ImpactMedium,
            ImpactHeavy,
            Selection
        }

        public Feedback feedback;

        void OnEnable()
        {
            var button = GetComponent<Button>();
            button.onClick.AddListener(LoadScene);
        }

        void OnDisable()
        {
            var button = GetComponent<Button>();
            button.onClick.RemoveListener(LoadScene);
        }

        void LoadScene()
        {
            switch (feedback)
            {
                case Feedback.NotificationSuccess:
                    TapticManager.Notification(NotificationFeedback.Success);
                    break;
                case Feedback.NotificationWarning:
                    TapticManager.Notification(NotificationFeedback.Warning);
                    break;
                case Feedback.NorificationError:
                    TapticManager.Notification(NotificationFeedback.Error);
                    break;
                case Feedback.ImpactLight:
                    TapticManager.Impact(ImpactFeedback.Light);
                    break;
                case Feedback.ImpactMedium:
                    TapticManager.Impact(ImpactFeedback.Medium);
                    break;
                case Feedback.ImpactHeavy:
                    TapticManager.Impact(ImpactFeedback.Heavy);
                    break;
                case Feedback.Selection:
                    TapticManager.Selection();
                    break;
            }
        }
    }
}