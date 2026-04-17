import 'package:flutter/material.dart';

import '../models/animal.dart';
import '../models/donation.dart';
import '../models/expense.dart';
import '../models/post.dart';
import '../models/shelter.dart';
import '../models/user.dart';

class MockData {
  static const stories = [
    'https://picsum.photos/id/433/200/200',
    'https://picsum.photos/id/237/200/200',
    'https://picsum.photos/id/593/200/200',
    'https://picsum.photos/id/1025/200/200',
    'https://picsum.photos/id/1062/200/200',
  ];

  static final shelters = <Shelter>[
    const Shelter(
      id: 's1',
      name: 'Baku Rescue Home',
      location: 'Baku',
      animalCount: 76,
      rating: 4.8,
      coverPhoto: 'https://picsum.photos/id/1011/1200/800',
      gallery: ['https://picsum.photos/id/106/800/500', 'https://picsum.photos/id/1074/800/500'],
      contact: '+994 50 123 45 67',
      breakdown: {'Dogs': 44, 'Cats': 28, 'Other': 4},
    ),
    const Shelter(
      id: 's2',
      name: 'Ganja Paws Center',
      location: 'Ganja',
      animalCount: 54,
      rating: 4.6,
      coverPhoto: 'https://picsum.photos/id/1024/1200/800',
      gallery: ['https://picsum.photos/id/1003/800/500', 'https://picsum.photos/id/219/800/500'],
      contact: '+994 55 234 56 78',
      breakdown: {'Dogs': 32, 'Cats': 20, 'Other': 2},
    ),
    const Shelter(
      id: 's3',
      name: 'Sumqayit Animal Aid',
      location: 'Sumqayit',
      animalCount: 48,
      rating: 4.7,
      coverPhoto: 'https://picsum.photos/id/239/1200/800',
      gallery: ['https://picsum.photos/id/718/800/500', 'https://picsum.photos/id/433/800/500'],
      contact: '+994 70 345 67 89',
      breakdown: {'Dogs': 23, 'Cats': 23, 'Other': 2},
    ),
    const Shelter(
      id: 's4',
      name: 'Lankaran Kind Tails',
      location: 'Lankaran',
      animalCount: 33,
      rating: 4.5,
      coverPhoto: 'https://picsum.photos/id/659/1200/800',
      gallery: ['https://picsum.photos/id/659/800/500', 'https://picsum.photos/id/582/800/500'],
      contact: '+994 12 456 78 90',
      breakdown: {'Dogs': 18, 'Cats': 13, 'Other': 2},
    ),
    const Shelter(
      id: 's5',
      name: 'Mingachevir Safe Paws',
      location: 'Mingachevir',
      animalCount: 41,
      rating: 4.4,
      coverPhoto: 'https://picsum.photos/id/718/1200/800',
      gallery: ['https://picsum.photos/id/783/800/500', 'https://picsum.photos/id/1020/800/500'],
      contact: '+994 51 567 89 01',
      breakdown: {'Dogs': 25, 'Cats': 15, 'Other': 1},
    ),
  ];

  static final animals = <Animal>[
    const Animal(id: 'a1', name: 'Toplan', breed: 'Mixed', age: '2 years', gender: 'Male', location: 'Baku', healthStatus: 'Recovered', story: 'Toplan was rescued after an accident and now loves playing.', images: ['https://picsum.photos/id/237/800/600'], type: AnimalType.dog, shelterId: 's1'),
    const Animal(id: 'a2', name: 'Mestan', breed: 'British Shorthair', age: '1 year', gender: 'Female', location: 'Ganja', healthStatus: 'Vaccinated', story: 'Mestan was found in rain and is now healthy.', images: ['https://picsum.photos/id/593/800/600'], type: AnimalType.cat, shelterId: 's2'),
    const Animal(id: 'a3', name: 'Duman', breed: 'Shepherd Mix', age: '3 years', gender: 'Male', location: 'Sumqayit', healthStatus: 'Needs dental care', story: 'Duman is calm and social, waiting for a home.', images: ['https://picsum.photos/id/1025/800/600'], type: AnimalType.dog, shelterId: 's3'),
    const Animal(id: 'a4', name: 'Bulud', breed: 'Van Cat', age: '8 months', gender: 'Female', location: 'Baku', healthStatus: 'Good', story: 'Bulud is playful and loves soft blankets.', images: ['https://picsum.photos/id/1062/800/600'], type: AnimalType.cat, shelterId: 's1'),
    const Animal(id: 'a5', name: 'Qaya', breed: 'Mixed', age: '4 years', gender: 'Male', location: 'Lankaran', healthStatus: 'Special diet', story: 'Qaya is gentle and needs regular nutritious meals.', images: ['https://picsum.photos/id/433/800/600'], type: AnimalType.dog, shelterId: 's4'),
    const Animal(id: 'a6', name: 'Minnos', breed: 'Siamese Mix', age: '2 years', gender: 'Female', location: 'Mingachevir', healthStatus: 'Recovered', story: 'Minnos survived cold winter nights and is now safe.', images: ['https://picsum.photos/id/219/800/600'], type: AnimalType.cat, shelterId: 's5'),
    const Animal(id: 'a7', name: 'Leo', breed: 'Labrador Mix', age: '5 years', gender: 'Male', location: 'Baku', healthStatus: 'Good', story: 'Leo helps calm younger puppies at the shelter.', images: ['https://picsum.photos/id/1003/800/600'], type: AnimalType.dog, shelterId: 's1'),
    const Animal(id: 'a8', name: 'Sehriyar', breed: 'Tabby', age: '1.5 years', gender: 'Male', location: 'Ganja', healthStatus: 'Vaccinated', story: 'Sehriyar was rescued from a market area.', images: ['https://picsum.photos/id/106/800/600'], type: AnimalType.cat, shelterId: 's2'),
    const Animal(id: 'a9', name: 'Narin', breed: 'Mixed', age: '6 months', gender: 'Female', location: 'Sumqayit', healthStatus: 'Under treatment', story: 'Narin needs follow-up care and monthly support.', images: ['https://picsum.photos/id/659/800/600'], type: AnimalType.dog, shelterId: 's3'),
    const Animal(id: 'a10', name: 'Aylin', breed: 'Calico', age: '3 years', gender: 'Female', location: 'Lankaran', healthStatus: 'Good', story: 'Aylin loves children and social spaces.', images: ['https://picsum.photos/id/718/800/600'], type: AnimalType.cat, shelterId: 's4'),
    const Animal(id: 'g1', name: 'Rex', breed: 'Street Mix', age: '2 years', gender: 'Male', location: 'Baku', healthStatus: 'Monthly checkups', story: 'Supported through distant guardianship program.', images: ['https://picsum.photos/id/783/800/600'], type: AnimalType.dog, guardianName: 'Elvin M.', monthlyFee: 25, guardianshipStatus: 'Active'),
    const Animal(id: 'g2', name: 'Mavis', breed: 'Street Cat', age: '1 year', gender: 'Female', location: 'Sumqayit', healthStatus: 'Sterilized', story: 'Mavis receives regular food and care via guardians.', images: ['https://picsum.photos/id/1020/800/600'], type: AnimalType.cat, guardianName: 'Aysel K.', monthlyFee: 20, guardianshipStatus: 'Active'),
  ];

  static final posts = List.generate(
    15,
    (i) => Post(
      id: 'p$i',
      author: i.isEven ? 'Baku Rescue Home' : 'Volunteer Nigar',
      avatar: stories[i % stories.length],
      description: i.isEven
          ? 'Bu gun $i-ci xilas hekayemiz: yardiminizla daha bir heyvan tehlukesizdir. / Rescue update #$i thanks to your support.'
          : 'Urgent care completed for puppy #$i. Every manat matters!',
      image: 'https://picsum.photos/id/${200 + i}/1200/900',
      likes: 120 + i * 8,
      comments: 12 + i,
    ),
  );

  static final donations = List.generate(
    20,
    (i) => Donation(
      id: 'd$i',
      donor: 'Donor ${i + 1}'.replaceRange(6, 7, '*'),
      amount: 10 + (i % 7) * 15,
      date: DateTime.now().subtract(Duration(days: i)),
    ),
  );

  static final expenses = List.generate(
    15,
    (i) => Expense(
      id: 'e$i',
      amount: 25 + i * 12,
      purpose: [
        'Dog food supply',
        'Cat litter and hygiene',
        'Sterilization campaign',
        'Vaccination drive',
        'Emergency surgery support'
      ][i % 5],
      date: DateTime.now().subtract(Duration(days: i * 2)),
      category: ['Food', 'Health', 'Medicine', 'Shelter', 'Transport'][i % 5],
      proofUrl: 'https://picsum.photos/id/${300 + i}/800/500',
    ),
  );

  static final leaderboard = List.generate(
    10,
    (i) => {'name': 'User ${i + 1}', 'xp': 2500 - i * 170},
  );

  static const badges = [
    {'title': 'First Donation', 'earned': true},
    {'title': 'Monthly Hero', 'earned': true},
    {'title': 'Guardian Angel', 'earned': true},
    {'title': 'Shelter Friend', 'earned': false},
    {'title': 'Top 10', 'earned': false},
    {'title': 'Yearly Supporter', 'earned': false},
  ];

  static final user = AppUser(
    name: 'Orxan Hummatov',
    avatar: 'https://picsum.photos/id/1005/300/300',
    memberSince: DateTime(2024, 2, 10),
    totalDonated: 860,
    animalsHelped: 19,
    xp: 2650,
    level: 7,
    subscription: 30,
  );

  static const spendingStrategy = <String, double>{
    'Food': 38,
    'Medicine': 24,
    'Sterilization': 20,
    'Shelter': 12,
    'Rescue': 6,
  };

  static const strategyColors = [
    Color(0xFF1565C0),
    Color(0xFF1E88E5),
    Color(0xFF42A5F5),
    Color(0xFF64B5F6),
    Color(0xFF90CAF9),
  ];
}