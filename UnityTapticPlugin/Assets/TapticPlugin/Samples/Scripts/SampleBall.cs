using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace TapticPlugin
{
    [RequireComponent(typeof(Rigidbody), typeof(AudioSource))]
    public class SampleBall : MonoBehaviour
    {
        public AudioClip se;

        Vector3 startPosition;

        AudioSource audioSource;
        void OnEnable()
        {
            startPosition = transform.position;
            audioSource = GetComponent<AudioSource>();
        }

        void OnCollisionEnter(Collision collision)
        {
            float volume = collision.relativeVelocity.magnitude;
            audioSource.PlayOneShot(se, volume);
            Debug.LogFormat("hit :{0}", volume);

            ImpactFeedback feedback;
            if (volume < 2)
            {
                feedback = ImpactFeedback.Light;
            }
            else if (volume < 5)
            {
                feedback = ImpactFeedback.Medium;
            }
            else
            {
                feedback = ImpactFeedback.Heavy;
            }
            TapticManager.Impact(feedback);

        }

        public void Retey()
        {
            transform.position = startPosition;
        }
    }
}