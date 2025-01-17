const STORE_ID = 'user_session-v1.0.0';

const app = new Vue({
  el: '#app',
  data: {
    temp: {
      password: null,
    },
    current_user: {
      id: null,
      email: null,
      token: null,
    },
    current_pr: {
      weight: 0,
      reps: 0,
    },
    new_activity_log: {
      activity_id: null,
      weight: null,
      reps: null,
      time: null,
      notes: null,
      completed_at: null,
    },
    activities: [],
    activity_logs: [],
  },
  methods: {
    get: function (url) {
      return fetch(url, {
        method: 'GET',
        headers: {
          'Authorization': `Bearer ${this.current_user.token}`,
          'Content-Type': 'application/json',
        },
      }).then(response => response.json());
    },
    post: function (url, body) {
      return fetch(url, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${this.current_user.token}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(body),
      }).then(response => response.json());
    },
    signed_in: function () {
      return !!this.current_user.token;
    },
    sign_in: function () {
      this.post('/users/sign_in', {
        email: this.current_user.email,
        password: this.temp.password,
      })
        .then(json => {
          this.current_user.id = json.user.id;
          this.current_user.token = json.token;

          this.load_activities();
          this.load_activity_logs();
        })
        .catch(err => console.error(err))

      this.temp.password = null;
    },
    sign_out: function () {
      this.current_user.token = null;
      this.current_user.email = null;
      this.current_user.name = null;
    },
    load_activities: function () {
      this.get('/activities')
        .then(json => {
          this.activities = json;
        })
        .catch(err => console.error(err));
    },
    load_activity_logs: function () {
      this.get('/activity_logs')
        .then(json => {
          this.activity_logs = json;
        })
        .catch(err => console.error(err));
    },
    fetch_current_pr: function () {
      this.get(`/activity_logs?activity_id=${this.new_activity_log.activity_id}`)
        .then(json => {
          this.current_pr = json.reduce((agg, log) => {
            return log.weight > agg.weight && log.reps > 0 ? log : (log.weight == agg.weight ? (log.reps > agg.reps ? log : agg) : agg);
          }, { weight: 0, reps: 0 });
        })
        .catch(err => console.error(err));
    },
    log_activity: function () {
      var new_activity_log = {
        activity_id: this.new_activity_log.activity_id,
        weight: this.new_activity_log.weight,
        reps: this.new_activity_log.reps,
        time: this.new_activity_log.time,
        notes: this.new_activity_log.notes,
      };

      if (this.new_activity_log.completed_at) {
        new_activity_log.completed_at = (new Date(this.new_activity_log.completed_at).getTime() / 1000);
      }

      this.post('/activity_logs', new_activity_log)
        .then(json => {
          this.activity_logs.push(json);

          this.new_activity_log.weight = null;
          this.new_activity_log.reps = null;
          this.new_activity_log.time = null;
          this.new_activity_log.notes = null;

          this.fetch_current_pr();
        })
        .catch(err => console.error(err))
    }
  },
  updated: function () {
    localStorage.setItem(STORE_ID, JSON.stringify(this.current_user));
  },
  created: function () {
    let current_user = localStorage.getItem(STORE_ID);

    if (current_user) {
      this.current_user = JSON.parse(current_user);

      this.load_activities();
      this.load_activity_logs();
    }
  }
});
