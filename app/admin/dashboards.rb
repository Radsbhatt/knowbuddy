ActiveAdmin::Dashboards.build do

  users = User.with_deleted
  section "Recent Posts", priority: 1 do
    table_for KyuEntry.order('id desc').limit(10) do
      column("Subject") {|kyu_entry| kyu_entry.subject }
      column("Contributor") {|kyu_entry| users.find(kyu_entry.user_id).
              name || users.find(kyu_entry.user_id).email}
    end
  end

  section "Posts", priority: 2 do
    table_for User.limit(10) do
      column("Contributor") {|user| user.name || user.email}
      column("Posts Count") {|user| User.find(user.id).kyu_entries.count }
    end
  end

  section "Visits", priority: 3 do
    table_for User.order('sign_in_count desc').limit(10) do
      column("Contributor") {|user| user.name if user.name || user.email}
      column("visit count") {|user| user.sign_in_count }
    end
  end
end

