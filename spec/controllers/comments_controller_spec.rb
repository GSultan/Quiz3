require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  context "comments" do
    let(:user) {FactoryGirl.create(:user)}
    let(:idea) {FactoryGirl.create(:idea)}
    l et(:comment) {FactoryGirl.create(:comment, idea: idea)}

    it "requires user to login to create a comment" do
      # GIVEN, WHEN , THEN
      post :create, params: { comment: {body: "testbody"}, idea_id: idea.id }
      # expect(errors).to be(present)
      expect(response).to redirect_to(new_session_path)
    end
    #
    it "requires user to login to delete a comment" do

      session[:user_id] = user.id
      delete :destroy, params: {id: comment.id}

      expect(Comment.count).to eq(0)
    end
  # end

      # post :delete, comment: {}
    # it "redirects back to idea show page after creation" do
    #   session[:user_id] = user.id
    #   post :create,
    #   expect(response).to redirect_to(idea_path)
    # end
    #
    # it "redirects back to idea show page after deletion" do
    #
    # end
  end
end
#      it 'redirect to the idea show page' do
#        @request.session[:user_id] = user.id
#        valid_request
#        delete :destroy, params: { id: idea.comments.last.id }
#        expect(response).to redirect_to idea_path(idea)
#      end

  # it "associates comments with the logged in user"
  # it "only allows users to delete own comments"
  #   #
  # it "allows idea owners to delete comments on their ideas"
#     #
# RSpec.describe CommentsController, type: :controller do
#  let(:idea) {create(:idea)}
#  let(:user) {create(:user)}
#
#  describe '#create' do
#    def valid_request
#      post :create, params: { comment: attributes_for(:comment), idea_id: idea.id }
#    end
#
#    context 'with no user signed in' do
#      it 'redirect_to the user log in page' do
#        valid_request
#        expect(response).to redirect_to '/sessions/new'
#      end
#    end
#
#    context 'create a comment' do
#      before { request.session[:user_id] = user.id }
#      it 'redirect to the idea show page' do
#        valid_request
#        expect(response).to redirect_to idea_path(idea)
#      end
#
#      it 'associates the review with the signed in user' do
#        valid_request
#        expect(Comment.last.user_id).to eq(session[:user_id])
#      end
#    end
#  end
#
#  describe '#destroy' do
#    def valid_request
#      post :create, params: { comment: attributes_for(:comment), idea_id: idea.id }
#    end
#
#    context 'delete a comment' do
#      # before do
#      #   @request.session[:user_id] = user.id
#      # end
#
#
#      it "should not delete other users's comments" do
#        @request.session[:user_id] = user.id
#        valid_request
#        @request.session[:user_id] = nil
#        @request.session[:user_id] = FactoryGirl.create(:user).id
#        count_before = Comment.count
#        delete :destroy, params: { id: idea.comments.last.id }
#        count_after = Comment.count
#        expect(count_after).to eq(count_before)
#      end
#
#      it "should allow idea owner delete any comments on their ideas" do
#        owner = idea.user
#        @request.session[:user_id] = FactoryGirl.create(:user).id
#        count_before = Comment.count
#        valid_request
#        delete :destroy, params: { id: idea.comments.last.id }
#        @request.session[:user_id] = owner.id
#        count_after = Comment.count
#        expect(count_after).to eq(count_before)
#      end
#
#    end
#  end
#
# end

  # describe "GET #create" do
  #   it "returns http success" do
  #     get :create
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end
