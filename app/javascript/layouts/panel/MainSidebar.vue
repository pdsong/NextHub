<template>
  <nav>
    <div class="profile">
      <img
        src="https://upload.wikimedia.org/wikipedia/commons/6/62/Ruby_On_Rails_Logo.svg"
        alt="profile_picture"
      />
      <h3>Ruby on Rails</h3>
      <p>Vue.js</p>
    </div>
    <ul>
      <li >
        <router-link  
          :to="{
            name: 'index',
          }"
          class="item"
        >
          My Dashboard
        </router-link>
      </li>
      <li>
        <router-link  
          :to="{
            name: 'news',
          }"
          class="item"
        >
          黑客新闻
        </router-link>
      </li>
      <li>
        <router-link  
          :to="{
            name: 'favoriteLink',
          }"
          class="item"
        >
          我的收藏
        </router-link>
      </li>

      <li>
        <span class="item">Categories</span>
      </li>
      <li>
        <span class="item">Messages</span>
      </li>
      <li>
        <span class="item">Companies</span>
      </li>
      <li>
        <span class="item">Users</span>
      </li>
      <li>
        <span class="item">Settings</span>
      </li>
    </ul>
  </nav>
</template>

<script setup lang="ts"></script>
