module Users
    class ElementsController < UsersController
      before_action :set_user
      before_action :set_post
      before_action :set_element, only: %i[ show edit update destroy ]
    
      # GET /elements or /elements.json
      # def index
        # @elements = Element.all
      # end
    
      # GET /elements/1 or /elements/1.json
      # def show
      # end
    
      # GET /elements/new
      # def new
        # @element = Element.new
      # end
    
      # GET /elements/1/edit
      # def edit
      # end
    
      # POST /elements or /elements.json
      def create
        @element = @post.elements.build(element_params)
    
        if @element.save
            notice = nil
        else
            notice = @element.errors.full_messages.join(". ") << "."
        end
        redirect_to edit_post_path(@post), notice: notice
      end
    
      # PATCH/PUT /elements/1 or /elements/1.json
      def update
        @element.update(element_params)
        redirect_to edit_post_path(@element.post), notice: "Element was successfully updated."
      end
    
      # DELETE /elements/1 or /elements/1.json
      def destroy
        @element.destroy
          redirect_to edit_post_path(@element.post), notice: "Element was successfully destroyed."
      end
    
      private

        def set_user
            @user = User.find(current_user.id)
        end

        def set_post
            @post = current_user.posts.find(params[:post_id])
        end

        # Use callbacks to share common setup or constraints between actions.
        def set_element
          @element = @post.elements.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def element_params
          params.require(:element).permit(:element_type, :content, :image)
        end
    end
end
