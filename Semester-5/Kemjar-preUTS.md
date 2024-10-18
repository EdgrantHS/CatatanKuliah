# Kemjar pre-UTS

## Introduction (Week 1)

### Referensi

- W. Stallings, "Network Security Essentials: A..."
- Cisco CyberOps Course Curiculum v1.1
- CERT/CC, ENISA, NIST, CYMRU

### Grading

- Lab Practice & Hands on (40%)
- UAS (25%)
- UTS (20%)
- Assignment (15%)

### Major Attacks

- Malware
- DDoS
- Identity Theft

> Assignment 1: Summary Wannacry attack

## Network Security Principles (Week 2)

### Security Triads

- Confidentiality: Menjamin kerahasiaan informasi (Encryption)
- Integrity: Data tidak berubah (Hash)
- Availability: Authorized user dapat mengakses data (Backup)

> Non-Reputiation: User cannot deny sending a message

### Security Trinity/Goals

- Detection: At the time of event
- Prevention: Before happening
- Response: Recovery, after happening (RTO)

### Comprehensive Network Security

- People
  - Training
  - Professional skills
  - Emergency drills
  - Authorization & authentication
  - Physical security
- Processes: Aktivitas yang memastikan sistem jalan dengan baik
  - Vulnerability assessment (Penetration testing)
  - Policies & procedures
  - Audit regimes (Log)
  - Vendor follow-up
- Technology:
  - Firewall
  - dll

### Multi Layer Defenses

- Layering
  - Security dalam semua layer (Aplikasi, Internet, Network, Computer System, Data)
- Limiting
  - Authorization & authentication
  - Limitasi akses
  - Zero Trust Architecture: Trust no one
- Diversity
  - Setiap layer memiliki teknologi yang berbeda
- Obscurity
  - Menyembunyikan informasi
  - Internal jaringan jangan terlihat dari luar
- Simplicity
  - Sederhana di dalam, rumit di luar
  - Sederhana untuk user

## Threats, Risk, & Vulnerabilities (Week 3)

Risk = Threats x Vulnerabilities

| Risk                | Threats           | Vulnerabilities  |
| ------------------- | ----------------- | ---------------- |
| Business disruption | Hackers           | Software bugs    |
| Financial loss      | Natural disasters | Weak passwords   |
| Legal issues        | Malware           | Misconfiguration |

### Vulnerability Assessment

- Vulnerability Identification
- Analysis
- Risk Assessment
- Remediation

#### Zero Day Vulnerability

- Vulnerability yang belum diketahui vendor

### Types of Attacks

- Structured attacks: Planned, targeted
- Unstructured attacks: Random, opportunistic
- External attacks: From outside
- Internal attacks: From inside
- Passive attacks: Monitoring
  - Traffic analysis
- Active attacks: Modifying data
  - Masquerade
  - Replay
  - Modification
  - Denial of Service

### Stages of attacks

- Reconnaissance
- Scanning
- Gaining access
- Maintaining access
- Covering tracks

### Common Models

- Interruption (DoS)
  - Availability compromised
  - `A -> |      B`
- Interception
  - Confidentiality compromised
  - `A -> C, B`
- Modification
  - Integrity compromised
  - `A -> C -> B`
- Fabrication
  - Authenticity compromised
  - `A      C -> B`

## Ethical Hacking (Week 6)

### Common Metalogoies

- OSSTMM
- NIST SP 800-115
- OWASP WSTG
- PTES
- ISSAF
- MITRE ATT&CK
