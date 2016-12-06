using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

namespace TapticPlugin
{
    [RequireComponent(typeof(Button))]
    public class SceneLoadButton : MonoBehaviour
    {
        public string sceneName;

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
            SceneManager.LoadScene(sceneName);
        }
    }
}