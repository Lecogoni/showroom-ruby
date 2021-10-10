module Users # creation du module pour englober PostController fonctionne avec la modif faite dans les routes

    class PostsController < UsersController # change ApplicationController for USerscontroller
    before_action :set_user, only: %i[ show edit update destroy ]
    before_action :set_post, only: %i[ show edit update destroy ]


    # does that you must be log-in before you do anything with content
    before_action :authenticate_user!
            

    # GET /posts or /posts.json
    def index
        @posts = current_user.posts
    end

    # GET /posts/1 or /posts/1.json
    # def show
    # end

    # GET /posts/new
    def new
        @post = current_user.posts.build
    end

    # GET /posts/1/edit
    def edit
        @paragraph = @post.elements.build(element_type: 'paragraph')
    end

    # POST /posts or /posts.json
    def create
        @post = current_user.posts.build(post_params)

        if @post.save
            redirect_to @post, notice: 'Post was successfully created'
        else
            render :new
        end
    end

    # PATCH/PUT /posts/1 or /posts/1.json
    def update
        if @post.update(post_params)
            redirect_to @post, notice: 'Post was successfully updated'
        else
            render :edit
        end
    end

    # DELETE /posts/1 or /posts/1.json
    def destroy
        @post.destroy
        respond_to do |format|
            format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private

        def set_user
            @user = User.find(current_user.id)
        end

        # Use callbacks to share common setup or constraints between actions.
        def set_post
            @post = current_user.posts.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def post_params
            params.require(:post).permit(:title, :description) # inutile de passer :user_id => il l'est avec current_user et method build
        end
    end

end
