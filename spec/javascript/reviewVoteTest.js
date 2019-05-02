import { shallow } from 'enzyme'
import fetchMock from 'fetch-mock'

import Stop from '../../app/javascript/react/components/Stop'
import Review from '../../app/javascript/react/components/Review'

describe('vote component display', () => {

  let component;
  let voteBody;

  beforeEach(() => {
    let review = {
    "id": 1,
    "rating": 2,
    "body": "not enough pasta, too much sauce",
    "stop_id": 1,
    "up_votes": 1,
    "down_votes": 1,
    "user_id": 1,
    "created_at": "2019-04-24T19:20:15.921Z",
    "updated_at": "2019-04-24T19:20:15.921Z"
  }

    component = mount(
      <Review
        key = {review.id}
        review = {review}
      />)

    voteBody = {vote: 1}
    fetchMock.get('/api/v1/votes/1', {
      status: 200,
      body: voteBody
    });
  });

  afterEach(() => fetchMock.restore)

  it('should display votes data', (done) => {
    setTimeout(() => {
      expect(component.text()).toMatch(/Up votes: 1/)
      expect(component.text()).toMatch(/Down votes: 1/)
      done()
    },0)
  });

  it('should display votes icons', (done) => {
    setTimeout(() => {
      expect(component.find(".fa-thumbs-up").exists()).toEqual(true)
      expect(component.find(".fa-thumbs-down").exists()).toEqual(true)
      done()
    },0)
  });
});

describe('vote behavior test', () => {

  let component;
  let voteBody;

  beforeEach(() => {
    let review = {
    "id": 1,
    "rating": 2,
    "body": "not enough pasta, too much sauce",
    "stop_id": 1,
    "up_votes": 1,
    "down_votes": 1,
    "user_id": 1,
    "created_at": "2019-04-24T19:20:15.921Z",
    "updated_at": "2019-04-24T19:20:15.921Z"
  }

    component = mount(
      <Review
        key = {review.id}
        review = {review}
      />)

    voteBody = {vote: 1}
    fetchMock.get('/api/v1/votes/1', {
      status: 200,
      body: voteBody
    });
  });

  afterEach(() => fetchMock.restore)

  it('should display updated votes data and highlight', (done) => {
    let clickBody = {
      vote: 1,
      upVotes: 1,
      downVotes: 1
    }
    fetchMock.post('/api/v1/votes', {
      status: 200,
      body: clickBody
    });

    setTimeout(() => {
      expect(component.text()).toMatch(/Up votes: 1/)
      expect(component.text()).toMatch(/Down votes: 1/)
      expect(component.find(".active").exists()).toEqual(true)
      done()
    },0)
  });

});
