class CommentMailer < ApplicationMailer
    default from: 'soccer-note@example.com'
    def creation_email(member)
        @member = member
        mail(
            subject: 'ノートにコメントが記載されました',
            to: @member.email
        )
    end
end
