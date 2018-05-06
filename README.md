Dissertation Talk based on Beamer and Metropolis
---

[![Build Status][travis-badge]][travis]

- [Slides](https://nebgnahz.github.io/dissertation-talk/talk.pdf)
- [Slides (handout)](https://nebgnahz.github.io/dissertation-talk/talk-handout.pdf)

## Abstract: Adapting Swarm Applications

The swarm refers to the vast collection of networked sensors and actuators
installed in our connected world. Many swarm applications transport, distill,
and process large streams of data across the wide area in real time. The
increasing volume of data generated at the edge challenges the existing
approaches of directly connecting devices to the cloud.

In this talk, I will first present architecture design trends and challenges for
developing swarm applications. Specifically, I will focus on the challenges from
the scarce and variable WAN bandwidth and the heterogeneous compute environment
(from low-power microcontrollers to powerful compute units). When network
resources or compute resources are insufficient, non-adaptive applications will
suffer from increased latency or degraded accuracy. Existing approaches that
supports adaptation require extensive developer efforts to write manual policies
or are limited to application-specific solutions.

We present a systematic and quantitative approach to build adaptive swarm
applications. Our solution includes three stages: (1) a set of programming
abstractions that allow developers to express adaptation options; (2) a
combination of offline and online profiling tool that learns an accurate profile
to characterize resource demands and application utilities; (3) a runtime system
responsive to environment changes, maximizing application utility based on the
learned profile. We evaluate the effectiveness of adaptation with several swarm
applications: pedestrian detection, augmented reality, and monitoring log
analysis. Our experiments show that all applications can achieve low latency
responses with nominal accuracy drops.

## Credit

[**Metropolis**](https://github.com/matze/mtheme) is a simple, modern Beamer
theme suitable for anyone to use. It tries to minimize noise and maximize space
for content; the only visual flourish it offers is an (optional) progress bar
added to each slide.

<!-- link -->
[travis-badge]: https://travis-ci.com/nebgnahz/dissertation-talk.svg?token=FtzQss73KSBwcHhSsrGQ&branch=master
[travis]: https://travis-ci.com/nebgnahz/dissertation-talk
