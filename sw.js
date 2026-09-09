var CACHE = 'fp-manager-v1';

self.addEventListener('install', function(e) {
  self.skipWaiting();
});

self.addEventListener('activate', function(e) {
  e.waitUntil(self.clients.claim());
});

self.addEventListener('fetch', function(e) {
  if (e.request.method !== 'GET') return;
  e.respondWith(
    fetch(e.request)
      .then(function(r) {
        try {
          var copy = r.clone();
          caches.open(CACHE).then(function(c) { c.put(e.request, copy); });
        } catch (err) {}
        return r;
      })
      .catch(function() {
        return caches.match(e.request).then(function(c) {
          return c || caches.match('./');
        });
      })
  );
});